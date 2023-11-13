import Foundation

func folderCleanup() {
    let folderPath = "/home/pavel/dev/new_prog_lang_tasks/05_swift_async_listener/testdir"
    let fileManager = FileManager.default
    
    do {
        let contents = try fileManager.contentsOfDirectory(atPath: folderPath)
        for file in contents {
            let filePath = (folderPath as NSString).appendingPathComponent(file)
            try fileManager.removeItem(atPath: filePath)
        }
        print("Folder contents deleted.")
    } catch {
        print("Error deleting folder contents: \(error)")
    }
}

while true {
    folderCleanup()
    sleep(5)
}