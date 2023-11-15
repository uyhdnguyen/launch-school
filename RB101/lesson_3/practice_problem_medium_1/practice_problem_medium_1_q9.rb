# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)

# Method foo will always return 'yes'
# 'yes' is not euqal to 'no' in bar method. Hence, the return will be 'no'
