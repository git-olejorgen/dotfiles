-- wiki / note editor
return {
  "vimwiki/vimwiki",
 init = function()
   vim.g.vimwiki_list = {
     { path = "~/Documents/", syntax = "markdown", ext = ".md"}
   }
 end
}

