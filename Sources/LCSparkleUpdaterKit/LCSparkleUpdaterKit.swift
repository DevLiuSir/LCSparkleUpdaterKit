//
//  LCSparkleUpdaterKit.swift
//  LCSparkleUpdaterKit
//
//  Created by DevLiuSir on 2023/3/2.
//

import Foundation
import Sparkle


/// Sparkle更新功能的主入口类，提供应用更新管理功能
public final class LCSparkleUpdaterKit {
    
    // MARK: - 单例实现
    public static let shared = LCSparkleUpdaterKit()
    private init() {}
    
    // MARK: - 公开方法
    
    /// 检测应用更新
    /// - Parameter background: 是否在后台检测更新。设为true时，若无新版本则不显示任何提示
    public func checkForUpdates(background: Bool = true) {
        if background {
            updateController.updater.checkForUpdatesInBackground()
        } else {
            updateController.checkForUpdates(nil)
        }
    }
    
    // MARK: - 私有属性
    
    /// 懒加载的Sparkle更新控制器
    private lazy var updateController: SPUStandardUpdaterController = {
        let controller = SPUStandardUpdaterController(startingUpdater: true, updaterDelegate: self, userDriverDelegate: self)
        controller.updater.automaticallyChecksForUpdates = true
        return controller
    }()
}



//MARK: - SPUUpdaterDelegate, SPUStandardUserDriverDelegate
extension LCSparkleUpdaterKit: SPUUpdaterDelegate, SPUStandardUserDriverDelegate {
    
    func updater(_ updater: SPUUpdater, didFinishLoading appcast: SUAppcast) {
        print("Sparkle 获取xml文件成功: \(appcast.items.first?.propertiesDictionary ?? [:])")
    }
    
    func updaterDidNotFindUpdate(_ updater: SPUUpdater) {
        print("Sparkle 暂无更新");
    }
    
    func updater(_ updater: SPUUpdater, didFindValidUpdate item: SUAppcastItem) {
        print("Sparkle 有可用升级:\nVersion: \(item.displayVersionString)\nBuild number: \(item.versionString)\nUrl:\(item.fileURL?.absoluteString ?? "")\nNote: \(item.itemDescriptionFormat ?? "")")
    }
    
    func updater(_ updater: SPUUpdater, userDidMake choice: SPUUserUpdateChoice, forUpdate updateItem: SUAppcastItem, state: SPUUserUpdateState) {
        switch (choice) {
        case .skip:     print("Sparkle 用户点击 跳过这个版本");
        case .install:  print("Sparkle 用户点击 安装更新");
        case .dismiss:  print("Sparkle 用户点击 稍后提醒");
        default: break;
        }
    }
}
