local jdtls_path = vim.fn.stdpath('data') .. "/mason/packages/jdtls"
local config_dir = jdtls_path .. "/config_linux"
local plugins_dir = jdtls_path .. "/plugins/"
local jar_dir = plugins_dir .. "org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local lombok_dir = plugins_dir .. "lombok.jar"

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
    return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
os.execute("mkdir " .. workspace_dir)

local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-javaagent:' .. lombok_dir,
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        '-jar', jar_dir,
        '-configuration', config_dir,
        '-data', workspace_dir
    },

    root_dir = root_dir,

    settings = {
        java = {
            home = '/usr/lib/jvm/java-1.17.0-openjdk-amd64',
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = "/usr/lib/jvm/java-1.17.0-openjdk-amd64"
                    }
                },
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            format = {
                enabled = true,
                -- settings = {
                --     url = vim.fn.stdpath "config" .. "intellij-java-google-style.xml",
                --     profile = "GoogleStyle",
                -- },
            },
        },
        signatureHelp = { enabled = true },
        completion = {
            favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
            },
            importOrder = {
                "java",
                "javax",
                "com",
                "org",
            },
        },
        sources = {
            organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
            },
        },
        codeGeneration = {
            toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            },
            useBlocks = true,
        },
    },

    flags = {
        allow_incremental_sync = true,
    },
}

require('jdtls').start_or_attach(config)

