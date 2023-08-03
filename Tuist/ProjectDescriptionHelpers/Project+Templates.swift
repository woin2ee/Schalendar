//
//  Project+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by Jaewon Yun on 2023/05/19.
//

import ProjectDescription

extension Project {
    
    public static func makeProject(
        name: String,
        organizationName: String? = ORGANIZATION,
        options: ProjectDescription.Project.Options = .options(),
        packages: [ProjectDescription.Package] = [],
        settings: ProjectDescription.Settings? = .settings(),
        targets: [ProjectDescription.Target],
        schemes: [ProjectDescription.Scheme],
        fileHeaderTemplate: ProjectDescription.FileHeaderTemplate? = nil,
        additionalFiles: [ProjectDescription.FileElement] = [],
        resourceSynthesizers: [ProjectDescription.ResourceSynthesizer] = .default
    ) -> Project {
        return .init(
            name: name,
            organizationName: organizationName,
            options: options,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes,
            fileHeaderTemplate: fileHeaderTemplate,
            additionalFiles: additionalFiles,
            resourceSynthesizers: resourceSynthesizers
        )
    }
}

