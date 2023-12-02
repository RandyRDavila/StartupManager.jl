module StartupManager

export StartupFile, add_package!, remove_package!

using Pkg

"""
    struct StartupFile

Represents a Julia startup file.

# Fields
- `path::String`: The file path to the startup file (`startup.jl`). This is usually
located at `~/.julia/config/startup.jl`.
"""
struct StartupFile
    path::String
end

"""
    StartupFile() -> StartupFile

Construct a StartupFile object representing the default Julia startup file
located at `~/.julia/config/startup.jl`.

```julia
julia> using StartupManager

julia> sf = StartupFile()
```
"""
function StartupFile()
    return StartupFile(joinpath(homedir(), ".julia", "config", "startup.jl"))
end

"""
    add_package!(sf::StartupFile, pkg::String)

Add a Julia package to the startup file for automatic loading. If the package is not
installed, a warning is issued and the package is not added.

# Example
```julia
julia> using StartupManager

julia> sf = StartupFile()

julia> add_package!(sf, "Example")
```
"""
function add_package!(sf::StartupFile, pkg::String)
    current_contents = isfile(sf.path) ? read(sf.path, String) : ""

    using_line = "using $pkg"
    if !occursin(using_line, current_contents)
        open(sf.path, "a") do file
            write(file, "$using_line\n")
            @warn "$pkg added to startup file."
        end
    end

    return nothing
end

"""
    remove_package!(sf::StartupFile, pkg::String)

Remove a Julia package from the startup file. If the package is not found in the
startup file, a warning is issued and nothing is done.

# Example
```julia
julia> using StartupManager

julia> sf = StartupFile()

julia> add_package!(sf, "Example")

julia> remove_package!(sf, "Example")
```
"""
function remove_package!(sf::StartupFile, pkg::String)
    if isfile(sf.path)
        current_contents = read(sf.path, String)
        using_line = "using $pkg"
        current_contents = replace(current_contents, using_line * "\n" => "")
        write(sf.path, current_contents)
    else
        @warn "Startup file not found."
    end

    return nothing
end

end
