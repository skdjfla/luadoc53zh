--Lua Э�� ����
function foo (a)
	print("foo", a)
	return coroutine.yield(2*a)
end

co = coroutine.create(function (a,b)
	print("co-body", a, b)
	local r = foo(a+1)
	print("co-body", r)
	local r, s = coroutine.yield(a+b, a-b)
	print("co-body", r, s)
	return b, "end"
end)

function t()
	print("main", coroutine.resume(co, 1, 10))
	print("main", coroutine.resume(co, "r"))
	print("main", coroutine.resume(co, "x", "y"))
	print("main", coroutine.resume(co, "x", "y"))
end
--[[
Lua 5.3.0  Copyright (C) 1994-2015 Lua.org, PUC-Rio
> require("case")
true
> t()
co-body 1       10
foo     2
main    true    4
co-body r
main    true    11      -9
co-body x       y
main    true    10      end
main    false   cannot resume dead coroutine
>
coroutine is perfect for game-dev
]]--

account = {money=100}
account.withdraw = function (howmuch)
	account.money = account.money - howmuch
    print ("money left="+account.money)
end



     
