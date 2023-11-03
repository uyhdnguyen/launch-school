=begin

Mortgage calculator program

=end

# Call Messages yml file
require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_message.yml')

# Set method prompt to call message from yml file
def prompt(message)
  puts "=> #{message}"
end

# Set the main loop for the calculator
loop do
  # Print welcome message and Get user's name
  prompt(MESSAGES['welcome_message'])
  prompt(MESSAGES['dash'])
  
  # Initialize user's name to get access in loop
  name = ''
  # Get user's name
  loop do
    name = gets.chomp

    if name.empty?
      prompt(MESSAGES['valid_name_message'])
    else
      break
    end
  end
  
  # Print greeting user's name
  prompt(MESSAGES['hello_message'] + name.capitalize)  
  
  # Get loan amount
  prompt(MESSAGES['loan_amount_message'])
  
  # Initilazie loan amount to get access in loop
  loan_amount = ''
  # Get loan amount
  loop do
    loan_amount = gets.chomp
    
    if loan_amount.empty? || loan_amount.to_f < 0
      prompt(MESSAGES['valid_number_message'])
    else
      break
    end
  end
  
  # Get APR percentage
  prompt(MESSAGES['apr_rate_message'])
  
  # Initialize APR to get access in loop
  annual_percentage_rate = ''
  # Get APR
  loop do
    annual_percentage_rate = gets.chomp
    
    if annual_percentage_rate.empty? || annual_percentage_rate.to_f < 0
      prompt(MESSAGES['valid_number_message'])
    else
      break
    end
  end
  
  # Get loan duration
  prompt(MESSAGES['loan_duration_message'])
  
  # Initialize loan duration in year
  loan_duration = ''
  # Get loan duration
  loop do
    loan_duration = gets.chomp
    
    if loan_duration.empty? || loan_duration.to_i < 0
      prompt(MESSAGES['valid_number_message'])
    else
      break
    end
  end
  
  # Set monthly interest rate from APR
  monthly_interest_rate = (annual_percentage_rate.to_f / 100 ) / 12
  # Set loan duration from years to months
  months = loan_duration.to_i * 12
  # Set formular for monthly payment
  monthly_payment = loan_amount.to_f() * 
                    (monthly_interest_rate / 
                    (1 - (1 + monthly_interest_rate)**(-months)))
                    
  # Print monthly payment
  prompt(MESSAGES['monthly_payment_message'] + "$#{format('%.2f', monthly_payment)}")
  
  # Get user's answer to perform calculation again
  prompt(MESSAGES['another_calculation_message'])
  
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  
  # Print thank you message
  prompt(MESSAGES['thank_you_message'])
end
