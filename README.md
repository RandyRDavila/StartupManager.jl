# StartupManager.jl

[![Build Status](https://github.com/RandyRDavila/StartupManager.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/RandyRDavila/StartupManager.jl/actions/workflows/CI.yml?query=branch%3Amain)
![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)

## Introduction

`StartupManager.jl` is a Julia package designed to manage the automatic loading of packages in Julia's startup process. It allows users to easily add or remove packages from their Julia `startup.jl` file, ensuring that these packages are loaded in every session.

## Features

- **Add Packages**: Automatically add packages to the startup file.
- **Remove Packages**: Safely remove packages from the startup file.
- **Project Specific**: Customize startup behavior for different Julia projects.

## Installation

Since `StartupManager.jl` is not registered in the Julia General Registry, it can be added directly from the GitHub repository.

In the Julia REPL, use the following command:

```julia
julia> using Pkg

julia> Pkg.add(url="https://github.com/RandyRDavila/StartupManager.jl")
```

## Usage

```julia
julia> using StartupManager

julia> sf = StartupFile()

julia> add_package!(sf, "PackageName")
```

After adding a package to your startup file restart you julia session.