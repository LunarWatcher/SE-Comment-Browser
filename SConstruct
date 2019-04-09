import os 

env = Environment()

if "TERM" in os.environ:
    env["ENV"]["TERM"] = os.environ["TERM"]
env["ENV"].update(x for x in os.environ.items() if x[0].startswith("CCC_"))

if "CXX" in os.environ:
    env["CXX"] = os.environ["CXX"]

env.Append(CXXFLAGS="-std=c++17 -pedantic -pedantic-errors -Wall -Wextra -Werror -MJ 'compile_commands.json' -O3")

stackcpp = SConscript("lib/stackcpp/SConstruct")
env.Append(CPPPATH=[ "include/spdlog/include", "lib/stackcpp/include/", "lib/stackcpp/lib/rapidjson/include" ])
env.Append(LIBS=[ "stackcpp", "boost_system", "boost_iostreams", "pthread", "crypto", "ssl" ])
env.Append(LIBPATH=[ "lib/stackcpp" ])

env.VariantDir("build/src", "src", duplicate=0)
env.Program("bin/CommentBrowser", Glob("build/src/*.cpp"))

