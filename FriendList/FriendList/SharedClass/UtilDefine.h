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

#define kScreenWidth            ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight           ([UIScreen mainScreen].bounds.size.height)

#endif /* UtilDefine_h */
