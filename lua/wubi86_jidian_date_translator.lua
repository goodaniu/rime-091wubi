
function wubi86_jidian_date_translator(input, seg)

    -- 日期格式说明：

    -- %a	abbreviated weekday name (e.g., Wed)
    -- %A	full weekday name (e.g., Wednesday)
    -- %b	abbreviated month name (e.g., Sep)
    -- %B	full month name (e.g., September)
    -- %c	date and time (e.g., 09/16/98 23:48:10)
    -- %d	day of the month (16) [01-31]
    -- %H	hour, using a 24-hour clock (23) [00-23]
    -- %I	hour, using a 12-hour clock (11) [01-12]
    -- %M	minute (48) [00-59]
    -- %m	month (09) [01-12]
    -- %p	either "am" or "pm" (pm)
    -- %S	second (10) [00-61]
    -- %w	weekday (3) [0-6 = Sunday-Saturday]
    -- %W	week number in year (48) [01-52]
    -- %x	date (e.g., 09/16/98)
    -- %X	time (e.g., 23:48:10)
    -- %Y	full year (1998)
    -- %y	two-digit year (98) [00-99]
    -- %%	the character `%´

    -- 输入完整日期
    -- if (input == "dwt") then
    --     yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %a %H:%M:%S"), ""))
    -- end

    if (input == "now") then
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), ""))
    end

    -- 输入日期
    if (input == "date") then
        --- Candidate(type, start, end, text, comment)
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y.%m.%d"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%m-%d-%Y"), ""))
    end

    -- 输入时间
    if (input == "time") then
        --- Candidate(type, start, end, text, comment)
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y%m%d%H%M%S"), ""))
    end

    -- 输入星期
    -- -- @JiandanDream
    -- -- https://github.com/KyleBing/rime-wubi86-jidian/issues/54
    if (input == "week") then
        local weekTab = {'日', '一', '二', '三', '四', '五', '六'}
        yield(Candidate("week", seg.start, seg._end, "周"..weekTab[tonumber(os.date("%w")+1)], ""))
        yield(Candidate("week", seg.start, seg._end, "星期"..weekTab[tonumber(os.date("%w")+1)], ""))
        yield(Candidate("week", seg.start, seg._end, os.date("%A"), ""))
        yield(Candidate("week", seg.start, seg._end, os.date("%a"), "缩写"))
        yield(Candidate("week", seg.start, seg._end, os.date("%W"), "周数"))
    end

    -- 输入月份英文
    -- if (input == "mont") then
    --     yield(Candidate("month", seg.start, seg._end, os.date("%B"), ""))
    --     yield(Candidate("month", seg.start, seg._end, os.date("%b"), "缩写"))
    -- end
		    -- 匹配格式：/ + 8位数字（如 /20231122）
    if input:match("^/[0-9][0-9][0-9][0-9][0-9][0-9]$") then
        local nums = input:sub(2,7)  -- 去掉前缀获取纯数字
        local y = tonumber(nums:sub(1,4))
        local m = nums:sub(5,6)
        
        -- 生成候选日期（带/前缀的原文会被替换）
        yield(Candidate("date", seg.start, seg._end, string.format("%s年%d月",y,m), ""))
    end
    if input:match("^/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$") then
        local nums = input:sub(2,9)  -- 去掉前缀获取纯数字
        local y = tonumber(nums:sub(1,4))
        local m = nums:sub(5,6)
        local d = nums:sub(7,8)
        
        -- 生成候选日期（带/前缀的原文会被替换）
        yield(Candidate("date", seg.start, seg._end, string.format("%s年%d月%d日",y,m,d), ""))
        yield(Candidate("date", seg.start, seg._end, y .. "-" .. m .. "-" .. d, ""))
        yield(Candidate("date", seg.start, seg._end, y .. "年" .. m .. "月" .. d .. "日", ""))
    end
end
    


return wubi86_jidian_date_translator

