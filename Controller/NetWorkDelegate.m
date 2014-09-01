//
//  NetWorkDelegate.m
//  FinaceDemo
//
//  Created by Wansheng Li on 14-7-29.
//  Copyright (c) 2014年 Wansheng Li. All rights reserved.
//

#import "NetWorkDelegate.h"

NSString* g_hostIpAddress = DEFAULT_HOST;

@implementation NetWorkDelegate
{
        AsyncSocket *_socket;
        NSString* _theHost;
        ushort _thePort;
}



static NSMutableDictionary* _handleDataRedFromServer;
static long _tcpActionSequence;

+ (instancetype)sharedInstance {
        static dispatch_once_t pred;
        static NetWorkDelegate * _sharedInstance;
        dispatch_once(&pred, ^{
                _sharedInstance = [[self alloc] init];
                _tcpActionSequence = 1;
                _handleDataRedFromServer = [[NSMutableDictionary alloc] init];
        });
        return _sharedInstance;
}


-(void)changeHost:(NSString*) newHost
{
        if ([_theHost isEqualToString:newHost])
                return;
        
        [self closeConnect];
        
        [self initializeWithHost:newHost Port:DEFAULT_PORT];
        
}

- (void)initWithDefault
{
        [self initializeWithHost:DEFAULT_HOST Port:DEFAULT_PORT];
}

-(void) closeConnect
{
        _theHost = nil;
        _theHost = 0;
        _socket = nil;
        _tcpActionSequence = 0;
        _handleDataRedFromServer = nil;
}
- (void)initializeWithHost:(NSString*)host Port:(ushort) port
{
        @synchronized(self)
        {
                _theHost = host;
                _thePort = port;
                if (_socket == nil)
                {
                        NSError *error = nil;
                        _socket = [[AsyncSocket alloc] initWithDelegate:self];
                        [_socket connectToHost:_theHost onPort:_thePort error:&error];
                        if (error)
                        {
                                NSLog(@"connect to host:%@ failed with error:%@", host, error);
                                _socket = nil;
                        }
                }
        }
}

-(void)reConnectAgain
{
        @synchronized(self)
        {
                
                NSLog(@"reconnect the host again....................");
                if (_socket == nil)
                {
                        NSError *error = nil;
                        _socket = [[AsyncSocket alloc] initWithDelegate:self];
                        [_socket connectToHost:_theHost onPort:_thePort error:&error];
                        if (error)
                        {
                                NSLog(@"reConnectAgain to host:%@ failed with error:%@", _theHost, error);
                                _socket = nil;
                        }
                }
        }
}

- (void)sendRawData:(NSData*)data callBack:(processFeedBack) handler
{
        
        if (_socket == nil)
        {
                NSLog(@"reconnect the host again....................");
                [self reConnectAgain];
        }
        
        if (_socket == nil)
        {
                NSLog(@"reconnect failed....................");
                return;
        }
        
        [_socket writeData:data withTimeout:-1 tag:_tcpActionSequence++];
}

- (void)sendDataByDictionary:(NSDictionary*)data callBack:(processFeedBack) handler
{
        
//	NSString *string = @"{\"userid\":\"anis\",\"password\":\"anis\",\"lookingFor\":\"login\",\"device\":\"iPhone\"}";
//	NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
//	[string release];
        
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
                NSLog(@"sendDataByDictionary:dic->%@",error);
        }
        
        if (_thePort == 0)
        {
                NSLog(@"please initialize the connection first....................");
                return;
        }
        
        if (_socket == nil)
        {
                NSLog(@"reconnect the host again....................");
                [self reConnectAgain];
        }
        
        if (_socket == nil)
        {
                NSLog(@"reconnect failed....................");
                return;
        }
        
        [_handleDataRedFromServer setObject:handler forKey:[NSNumber numberWithLong:_tcpActionSequence]];
        NSLog(@"Sending test Request:%@.........tag=%ld....", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding], _tcpActionSequence);
        
	[_socket readDataToData:[AsyncSocket DOUBLECRLFData] withTimeout:-1 tag:_tcpActionSequence];
        [_socket writeData:jsonData withTimeout:-1 tag:_tcpActionSequence++];
}


#pragma mark -
#pragma mark AsyncSocket Methods

- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err {
        NSLog(@"Disconnecting............ Error: %@", [err localizedDescription]);
        
        [ _handleDataRedFromServer enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                processFeedBack handler = (processFeedBack) obj;
                
                handler(nil, nil, err);
        }];
        
        [_handleDataRedFromServer removeAllObjects];
        
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock {
        NSLog(@"Disconnected...........");
        
        NSError *error = [[NSError alloc]init];
        [ _handleDataRedFromServer enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                        processFeedBack handler = (processFeedBack) obj;
                
                handler(nil, nil, error);
        }];
        
        [_handleDataRedFromServer removeAllObjects];

        [_socket setDelegate:nil];
        _socket = nil;
}

- (BOOL)onSocketWillConnect:(AsyncSocket *)sock {
        NSLog(@"onSocketWillConnect...........");
        return YES;
}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
        NSLog(@"Connected........... To %@:%i.", host, port);
}

- (NSString *)stringByRemovingControlCharacters: (NSString *)inputString
{
        NSCharacterSet *controlChars = [NSCharacterSet controlCharacterSet];
        NSRange range = [inputString rangeOfCharacterFromSet:controlChars];
        if (range.location != NSNotFound) {
                NSMutableString *mutable = [NSMutableString stringWithString:inputString];
                while (range.location != NSNotFound) {
                        [mutable deleteCharactersInRange:range];
                        range = [mutable rangeOfCharacterFromSet:controlChars];
                }
                return mutable; 
        } 
        return inputString; 
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
        NSString *string = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
        NSLog(@"Received Data (Tag: %li): %@", tag, string);
        
        NSString* newRetrievedString = [self stringByRemovingControlCharacters:string];
        NSData* ok_data = [newRetrievedString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *error = nil;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:ok_data options:NSJSONReadingAllowFragments error:&error];
        if (jsonObject != nil && error == nil)
        {
                NSDictionary *deserializedDictionary = nil;//(NSDictionary *)jsonObject;
                NSArray *deserializedArray = nil;// (NSArray *)jsonObject;
                NSLog(@"Successfully deserialized...........");
                if ([jsonObject isKindOfClass:[NSDictionary class]])
                {
                        
//                        NSLog(@"Dersialized JSON Dictionary = %@", deserializedDictionary);
                        deserializedDictionary = (NSDictionary *)jsonObject;
                        
                }
                else if ([jsonObject isKindOfClass:[NSArray class]])
                {
                        deserializedArray = (NSArray *)jsonObject;
//                        NSLog(@"Dersialized JSON Array = %@", deserializedArray);
                }
                else
                {
                        [_handleDataRedFromServer removeObjectForKey:[NSNumber numberWithLong:tag]];
                        NSLog(@"An error happened while deserializing the JSON data.");
                        return;
                }
                processFeedBack handler = [_handleDataRedFromServer objectForKey:[NSNumber numberWithLong:tag]];
                if (handler != nil)
                {
                        handler(deserializedDictionary, deserializedArray, nil);
                        [_handleDataRedFromServer removeObjectForKey:[NSNumber numberWithLong:tag]];
                }
                else
                        NSLog(@"----no handler for the request idx = %ld", tag);
        }
        else
        {
                NSLog(@"----%@ ------%@.", error, jsonObject);
        }
}

- (void)onSocket:(AsyncSocket *)sock didReadPartialDataOfLength:(CFIndex)partialLength tag:(long)tag partData:(NSMutableData *)pData {
        
//        NSString *string = [[NSString alloc] initWithBytes:[pData bytes] length:partialLength encoding:NSUTF8StringEncoding];
//        NSLog(@"onSocket:didReadPartialDataOfLength:%li tag:%li content:%@", partialLength, tag, string);
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag {
        NSLog(@"onSocket:didWriteDataWithTag:%li", tag);
}

+ (NSString *)dataFilePath:(NSString*) fileName
{
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        return [documentsDirectory stringByAppendingPathComponent:fileName];
}


@end
