```
numbers = [1, 2, 3, 4, 6]

desired_output = numbers.select { |num| numbers.index(num).even? }

p desired_output # [1, 3, 6]
```

 On line 4, `desired_output` is initialized and references the return value of calling `select` method on array object `numbers` with a `{}` block, which takes one parameter `num`, passed in as an argument. Inside of the block, `num` is represent each element of `numbers`.

 Upon each iteration, `index` method is called on `numbers` with `num` passed in as an argument. This will return the index of `num` in `numbers`. The return value is then chained and `even?` method is called on that value which return `true` or `false`. Because this is the last expression of the block, the return value of the block depending on whether the returned index is even or odd.

 `select` method returns a new array containing those elements of `numbers` for which `{}` block returns truthy value. Hence, the desired output is `[1, 3, 6]`. 

 `select` method is the optimal way to filter/ select objects in collection.