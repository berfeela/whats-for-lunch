# 🌟 Diamond Shape Generator 🌟

def print_line(spaces, stars)
  puts ' ' * spaces + '*' * stars
end

def generate_diamond(size)
  raise ArgumentError, "Size must be an odd number!" if size.even?

  mid = size / 2

  # Top half of the diamond (including the middle line)
  (0..mid).each do |i|
    spaces = mid - i
    stars  = 2 * i + 1
    print_line(spaces, stars)
  end

  # Bottom half of the diamond
  (mid - 1).downto(0) do |i|
    spaces = mid - i
    stars  = 2 * i + 1
    print_line(spaces, stars)
  end
end

def user_prompt
  puts "🌟 Welcome to the Diamond Generator 🌟"
  puts "Please enter an odd number for the size of the diamond: "
  size = gets.to_i
  generate_diamond(size)
rescue ArgumentError => e
  puts "⚠️  Error: #{e.message}"
end

# Run the generator
user_prompt

puts "\n✨ Thank you for using the Diamond Generator! ✨"
