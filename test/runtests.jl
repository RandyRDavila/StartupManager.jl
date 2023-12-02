using StartupManager
using Test

@testset "StartupManager Tests" begin
    mktemp() do filepath, io
        sf = StartupFile(filepath)

        # Test add_package!
        @testset "Add Package" begin
            add_package!(sf, "Test")  # Using "Test" or another known installed package
            contents = read(filepath, String)
            @test occursin("using Test", contents)
        end

        # Test remove_package!
        @testset "Remove Package" begin
            remove_package!(sf, "Test")
            contents = read(filepath, String)
            @test !occursin("using Test", contents)
        end
    end
end
