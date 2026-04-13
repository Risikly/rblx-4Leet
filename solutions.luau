-- rblx-4Leet: LeetCode-style solutions in Luau
-- https://github.com/Risikly/rblx-4Leet

local Solutions = {}

-- Two Sum
-- Given an array of integers and a target, return indices of the two numbers that add up to target.
function Solutions.twoSum(nums: {number}, target: number): {number}
	local seen: {[number]: number} = {}
	for i, v in ipairs(nums) do
		local complement = target - v
		if seen[complement] then
			return {seen[complement], i}
		end
		seen[v] = i
	end
	return {}
end

-- Reverse String
-- Reverse an array of characters in-place.
function Solutions.reverseString(s: {string}): {string}
	local left, right = 1, #s
	while left < right do
		s[left], s[right] = s[right], s[left]
		left += 1
		right -= 1
	end
	return s
end

-- Fibonacci Number
-- Return the nth Fibonacci number.
function Solutions.fib(n: number): number
	if n <= 1 then return n end
	local a, b = 0, 1
	for _ = 2, n do
		a, b = b, a + b
	end
	return b
end

-- Valid Palindrome
-- Return true if the string reads the same forwards and backwards (alphanumeric only, case-insensitive).
function Solutions.isPalindrome(s: string): boolean
	local cleaned = s:lower():gsub("[^%a%d]", "")
	local left, right = 1, #cleaned
	while left < right do
		if cleaned:sub(left, left) ~= cleaned:sub(right, right) then
			return false
		end
		left += 1
		right -= 1
	end
	return true
end

-- Maximum Subarray (Kadane's Algorithm)
-- Find the contiguous subarray with the largest sum.
function Solutions.maxSubArray(nums: {number}): number
	assert(#nums > 0, "nums must not be empty")
	local maxSum = nums[1]
	local current = nums[1]
	for i = 2, #nums do
		current = math.max(nums[i], current + nums[i])
		maxSum = math.max(maxSum, current)
	end
	return maxSum
end

return Solutions
