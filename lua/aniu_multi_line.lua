--- 过滤器：以\n为换行符打印
local function multi_line(input, seg)
  local words = {
        { text = "A.\nB.\nC.\nD.", code = "abcd", weight = 0, comment = "多行" },  
        { text = "\\documentclass[hm,ebooktitle]{gzgbook}\n\\title{标题}\n\\author{aniu}\n\\date{\\today}\n\\begin{document}\n\\cover\n\n\\end{document}", code = "book", weight = 0, comment = "多行" },
        { text = "|||\n|:-:|:-:|\n|||", code = "geso", weight = 0, comment = "多行" },
        { text = "	", code = "tab", weight = 0, comment = "制表符" },
    }
    
  -- table.sort(words, function(a, b) return a.quality > b.quality end)
  for _, word in pairs(words) do
    if (input == word.code) then
        local cand = Candidate("multi", seg.start, seg._end, word.text, word.comment)
        cand.quality = word.weight  -- 关键：设置权重
        -- cand.preedit = word.code   -- 可选：显示编码（依赖主题支持）
        -- cand.comment = word.comment
        yield(cand)
    end
  end
end

return multi_line
