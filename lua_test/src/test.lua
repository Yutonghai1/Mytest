---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lenovo.
--- DateTime: 2018/4/8 16:40
---

local rd = require("randomTest")

if not rd then
    print("Failed to require b!")
end
--print(key)
for i = 1, 10 do

    local key = rd.RandomString(14,5)
    print(key)
end


function shuffle(t)
    if type(t)~="table" then
        return
    end
    local l=#t
    local tab={}
    local index=1
    while #t~=0 do
        math.randomseed(os.clock()*math.random(1000000,90000000)+math.random(1000000,9000000)+tonumber(tostring(os.time()):reverse():sub(1, 6))+os.time())
        local n=math.random(0,#t)
        if t[n]~=nil then
            tab[index]=t[n]
            table.remove(t,n)
            index=index+1
        end
    end
    return tab
end
local t1 = {}
local t = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","a1","b1","c1","d1","e1","f1","g1","h1","i1","j1","k1","l1","m1","n1","o1","p1","q1","r1","s1","t1","u1","v1","w1","x1","y1","z1","a12","b12","c12","d12","e12","f12","g12","h12","i12","j12","k12","l12","m12","n12","o12","p12","q12","r12","s12","t12","u12","v12","w12","x12","y12","z12","a123","b123","c123","d123","e123","f123","g123","h123","i123","j123","k123","l123","m123","n123","o123","p123","q123","r123","s123","t123","u123","v123","w123","x123","y123","z123","a1234","b1234","c1234","d1234","e1234","f1234","g1234","h1234","i1234","j1234","k1234","l1234","m1234","n1234","o1234","p1234","q1234","r1234","s1234","t1234","u1234","v1234","w1234","x1234","y1234","z1234"}
--print("######size1:"..#t);

--while true do
--    os.execute("sleep 1")
--    local b = shuffle(t)
--    for key, value in pairs(b) do
--        print(key .. ":" .. value);
--
--    end
--    print("##########");
--end

--local b = shuffle(t)
--for i = 1, 10 do
--    for key, value in pairs(b) do
--        print(key .. ":" .. value);
--
--    end
--    print("##########");
--end


s='1234abcd'
-- 拆分成{"1","2","3","4","a","b","c","d"}

local k= #s
list1={}
for i=1,k do
    list1[i]=string.sub(s,i,i)
end
for i=1,k do
    --print(list1[i])
end

function compareStr(Str1,Str2)
    local result = "";
    if Str2 == nil or #Str2 == 0 then
        result = 0;
        print("学生没选不得分")
    else
        Str1 = string.gsub(Str1, " ", "")
        Str2 = string.gsub(Str2, " ", "")

        Str1 = string.upper(Str1);
        Str2 = string.upper(Str2);
        local raLen = #Str1
        local saLen = #Str2

        local raList={}
        local saList={}

        for i=1,raLen do
            raList[i]=string.sub(Str1,i,i)
        end
        for i=1,saLen do
            saList[i]=string.sub(Str2,i,i)
        end

        if raLen == saLen then

            local status = true;
            for i=1,saLen,1 do
                local q  = string.find(Str1, saList[i])
                if not q then
                    print("长度相等，有不同")
                    status = false;
                    result = 3;
                    break
                end
            end
            if status then
                --print("长度相等，全相同")
                result = 1;
            end
        elseif raLen < saLen then
            print("学生答案长，有错误")
            result = 3;
        else
            local status = true;
            for i=1,saLen,1 do
                local q  = string.find(Str1, saList[i])
                if not q then
                    print("学生答案短，有不同")
                    status = false;
                    result = 3;
                    break;
                end
            end
            if status then
                print("学生答案短，没全对")
                result = 2;
            end
        end
    end
    return result;
end

local a = "A  B  C"
local b = "abC" ;
local result = compareStr(a,b)
 --print(result)

--function trim(s)
--    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
--end
--print(a)
--local str = string.gsub(a, " ", "")
--print(str)
--
--local a = 4/80
--print(string.format("%0.2f",a)*100%100)
local today_date=os.date("%Y%m%d")
local yesterday_date=today_date-1
--print( os.date("%Y-%m-%d %H:%M:%S"))

function getNewDate(srcDateTime)
    --从日期字符串中截取出年月日时分秒
    local Y = tonumber(string.sub(srcDateTime,1,4))
    local M = tonumber(string.sub(srcDateTime,6,7))
    local D = tonumber(string.sub(srcDateTime,9,10))
    local H = tonumber(string.sub(srcDateTime,12,13))
    local MM = tonumber(string.sub(srcDateTime,15,16))
    local SS = tonumber(string.sub(srcDateTime,18,19))

    --把日期时间字符串转换成对应的日期时间
    local dt1 = os.time{year=Y, month=M, day=D, hour=H,min=MM,sec=SS}
    --根据时间单位和偏移量得到具体的偏移数据
    local ofset=60*90
    --指定的时间+时间偏移量
    local newTime =  os.date("%Y-%m-%d %H:%M:%S",dt1 + tonumber(ofset))
    return newTime
end
local time = "2018-04-14 12:31:50"
--print(time)
local newTime = getNewDate(time)
--print(newTime)
--local tempTable = {}
--tempTable["person_id"]			= 123
--tempTable["identity_id"]		= 1
--tempTable["question_id_char"]	= 123
--tempTable["jy_subject_en_name"]	= 123
--tempTable["is_all"]				= 333
--a = nil
--if next(tempTable) == nil then
--    print("a=nil")
--else
--    for key,val in pairs( tempTable) do
--        print(key.."::#######..."..val)
--    end
--    --print(tempTable.person_id)
--end
