@testable import SwagGenKit
@testable import Swagger
import PathKit
import Spectre
import Foundation

public func specTests() {

    let specsPath = Path(#file) + "../../../Specs"
    let specs = (try? specsPath.children().filter { $0.isDirectory && !$0.lastComponent.hasPrefix(".") } ) ?? []

    for specFolder in specs {

        let templateOptions: [String: String] = [:]

        describe("\(specFolder.lastComponent) spec") {

            $0.it("can generate") {

                let possibleExtensions = ["yml", "yaml", "json"]
                guard let specPath = possibleExtensions.map({ specFolder + "spec.\($0)" }).filter({ $0.exists }).first else {
                  throw TestSpecError.missingSpec
                }

                let spec = try SwaggerSpec(path: specPath)

                let templateType = "Swift"
                let templatePath = Path(#file) + "../../../Templates/\(templateType)"
                let templateConfig = try TemplateConfig(path: templatePath, options: templateOptions)

                let codeFormatter = SwiftFormatter(spec: spec)
                let context = codeFormatter.getContext()

                try expect(codeFormatter.schemaTypeErrors.count) == 0
                try expect(codeFormatter.valueTypeErrors.count) == 0

                let destinationPath = specFolder + "generated/\(templateType)"
                try destinationPath.mkpath()
                let generator = Generator(context: context, destination: destinationPath.normalize(), templateConfig: templateConfig)
                try _ = generator.generate(clean: .all, fileChanged: {_ in})
            }
        }
    }
}

enum TestSpecError: Error {
  case missingSpec
}