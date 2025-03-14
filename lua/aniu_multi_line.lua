--- 过滤器：以\n为换行符打印
local str1={ 
abcd="A.\nB.\nC.\nD.", 
book="\\documentclass[hm,ebooktitle]{gzgbook}\n\\title{标题}\n\\author{aniu}\n\\date{\\today}\n\\begin{document}\n\\cover\n\n\\end{document}",
}
local function multi_line(input, seg)
  for k, v in pairs(str1) do
    if (input == k) then
        yield(Candidate(k, seg.start, seg._end, v , "*"))
    end
  end
end

return multi_line
