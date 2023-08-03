//
//  Scheme+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by Jaewon Yun on 2023/05/22.
//

import ProjectDescription

extension Scheme {
    
    public static func makeAppScheme(
        customBuildAction: BuildAction? = nil,
        testAction: TestAction? = nil,
        customRunAction: RunAction? = .runAction(),
        customArchiveAction: ArchiveAction? = .archiveAction(configuration: .release),
        customProfileAction: ProfileAction? = .profileAction(),
        customAnalyzeAction: AnalyzeAction? = .analyzeAction(configuration: .debug)
    ) -> Scheme {
        let name: String = APPLICATION_NAME
        let shared: Bool = true
        let hidden: Bool = false
        let buildAction: BuildAction? = (customBuildAction == nil) ? .buildAction(targets: ["\(name)"]) : customBuildAction
        
        return .init(
            name: name,
            shared: shared,
            hidden: hidden,
            buildAction: buildAction,
            testAction: testAction,
            runAction: customRunAction,
            archiveAction: customArchiveAction,
            profileAction: customProfileAction,
            analyzeAction: customAnalyzeAction
        )
    }
    
    public static func makeFrameworkScheme(
        name: String,
        customBuildAction: ProjectDescription.BuildAction? = nil,
        testAction: ProjectDescription.TestAction? = nil,
        runAction: ProjectDescription.RunAction? = nil,
        archiveAction: ProjectDescription.ArchiveAction? = nil,
        profileAction: ProjectDescription.ProfileAction? = nil,
        analyzeAction: ProjectDescription.AnalyzeAction? = nil
    ) -> Scheme {
        let shared: Bool = true
        let hidden: Bool = false
        let buildAction: BuildAction? = (customBuildAction == nil) ? .buildAction(targets: ["\(name)"]) : customBuildAction
        
        return .init(
            name: name,
            shared: shared,
            hidden: hidden,
            buildAction: buildAction,
            testAction: testAction,
            runAction: runAction,
            archiveAction: archiveAction,
            profileAction: profileAction,
            analyzeAction: analyzeAction
        )
    }
    
    public static func hideScheme(name: String) -> Scheme {
        return .init(name: name, hidden: true)
    }
}
