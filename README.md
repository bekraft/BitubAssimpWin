# Bitub Assimp Redistribution Builder

Assimp binary NuGet package builder. Builds and packages Assimp as x86 and x64 prebuilt binaries
and headers files into a single nuget package.

See https://github.com/assimp/assimp.

## Contents

- packages Occt libraries into `lib/native/`
- copies header files into `build/native/include`

## Build Nuget package

Builds Assimp binaries with vcpkg from https://vcpkg.link/ports/assimp. Either uses vcpkg shipped with Visual Studio (if installed during installation) or a manually installed vcpkg toolchain. See https://github.com/microsoft/vcpkg.

Run
```bash
./build.cmd
nuget pack .\Bitub.Assimp.Win10.nuspec 
```

## Add prebuilt Nuget package to VC project

Within the consuming project create a file `package.config`:
```xml
<?xml version="1.0" encoding="utf-8"?>
<packages>
  <package id="Bitub.Assimp.Win10" version="5.4.0" targetFramework="native" />
</packages>
```

Add an additional `ImportGroup` to the consumer project configuration:
```xml 
  <ImportGroup Label="AssimpLibraries">
    <Import Project="..\packages\Bitub.Assimp.Win10.5.4.0\build\Bitub.Assimp.Win10.targets" />
  </ImportGroup>
```

Let the entire solution being reloaded.