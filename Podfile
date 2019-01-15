project 'Nitro.xcodeproj'

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Nitro' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Nitro

  pod 'TransitionButton'
  pod 'Proposer'
  #pod 'WKZombie'
  #pod 'FoldingCell'
  #pod 'HTYTextField'
  #pod 'EasySocial'
  #pod 'BulletinBoard'
  #pod "ILLoginKit"
  pod 'SideMenu'
  pod 'Alamofire'
  pod 'Kanna'
  pod 'SwiftScanner'
  pod 'Erik'
  pod 'FeedKit'
  pod 'ReachabilitySwift'  
  #hatt nicht funktioniert, weitere Tests in Zukunft
  pod 'SwiftSoup'
  
  target 'NitroTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NitroUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  post_install do |installer|
    installer.aggregate_targets.each do |target|
        if target.name != "UnitTestsTarget" then
            puts "adding app icons for #{target.name}"
            copy_pods_resources_path = "Pods/Target Support Files/#{target.name}/#{target.name}-resources.sh"
            string_to_replace = '--compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"'
            assets_compile_with_app_icon_arguments = '--compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}" --app-icon "${ASSETCATALOG_COMPILER_APPICON_NAME}" --output-partial-info-plist "${BUILD_DIR}/assetcatalog_generated_info.plist"'
            text = File.read(copy_pods_resources_path)
            new_contents = text.gsub(string_to_replace, assets_compile_with_app_icon_arguments)
            File.open(copy_pods_resources_path, "w") {|file| file.puts new_contents }
       end
    end
end


end
