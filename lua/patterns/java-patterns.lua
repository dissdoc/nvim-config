vim.api.nvim_create_autocmd({ "BufNewFile" }, {
    pattern = { "*.java" },
    callback = function ()
        vim.schedule(InsertJavaPackage)
    end
})

function InsertJavaPackage()
   vim.cmd [[
       let filename = expand("%")
       let filename = substitute(filename, "\.java$", "", "")
       let dir = getcwd() . "/" . filename
       let dir = substitute(dir, "^.*\/java\/", "", "")
       let dir = substitute(dir, "\/[^\/]*$", "", "")
       let dir = substitute(dir, "\/", ".", "g")
       let filename = substitute(filename, "^.*\/", "", "")
       let dir = "package " . dir . ";"
       let result = append(0, dir)
       let result = append(1, "")
       let result = append(2, "public class " . filename . " {")
       let result = append(4, "}")
   ]]
end
