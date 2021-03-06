//
//  Personalized.swift
//  EasyCoding
//
//  Created by Fanxx on 2019/11/20.
//

import UIKit
@_exported import EasyCoding

///需要个性化的操作
public protocol EasyPersonalizable:AnyObject {
    
}
///个性化相关资源提供者
public protocol EasyPersonalizedProviderType {
    ///应用到某个操作
    func apply(to target: EasyPersonalizable)
}
///个性化管理器，可用于多语言或主题等个性化操作
public protocol EasyPersonalizedManagerType: class {
    associatedtype ProviderType: EasyPersonalizedProviderType
    var targets: EasyWeakerArray<AnyObject> { get }
    var provider: ProviderType? { get }
}
extension EasyPersonalizedManagerType {
    ///注册需要多语言的目标，在语言变更和初始化时调用相关方法
    public func register(_ target: EasyPersonalizable) {
        self.targets.append(target)
        if let provider = self.provider {
            provider.apply(to: target)
        }
    }
    ///应用当前个性化设置
    public func apply() {
        if let provider = self.provider {
            self.targets.forEach { (target: EasyPersonalizable) in
                provider.apply(to: target)
            }
        }
    }
}
