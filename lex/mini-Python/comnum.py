# comma-number.py
import string 
def comma_number(number): 
    if number[0] in ['+', '-']:
        sign_mark, number = number[:1], number[1:]
    else: sign_mark = ''
    try:
        tmp = string.split(number, '.')
        num = tmp[0]; decimal = '.' + tmp[1]
    except:
        num = number; decimal = ''
    head_num = len(num) % 3
    result = ''
    for pos in range(len(num)):
        if pos == head_num and head_num: result = result + ','
        elif (pos - head_num) % 3 == 0 and pos:
            result = result + ','
        result = result + num[pos]
    return sign_mark + result + decimal

print(comma_number("12345678.345678"))
