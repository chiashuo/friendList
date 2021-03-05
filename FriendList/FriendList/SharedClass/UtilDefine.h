//
//  UtilDefine.h
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#ifndef UtilDefine_h
#define UtilDefine_h

#define isNullValue(object)     (object == nil || [object isKindOfClass:[NSNull class]])
#define isNotNullValue(object)  !isNullValue(object)

#endif /* UtilDefine_h */
