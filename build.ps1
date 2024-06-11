vcpkg install --triplet x86-windows
New-Item -ItemType Directory -Path build/lib/x86 -Force
Copy-Item vcpkg_installed/x86-windows/lib/*.lib build/lib/x86
Copy-Item vcpkg_installed/x86-windows/bin/*.dll build/lib/x86

vcpkg install --triplet x64-windows
New-Item -ItemType Directory -Path build/lib/x64 -Force
Copy-Item vcpkg_installed/x64-windows/lib/*.lib build/lib/x64
Copy-Item vcpkg_installed/x64-windows/bin/*.dll build/lib/x64

New-Item -ItemType Directory -Path build/include -Force
Copy-Item -Path vcpkg_installed/x64-windows/include/assimp/ -Destination build/include -recurse -Force