from collections import Counter
import argparse

LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
def decrypt_caesar(message, key):
    prt = key
    key = ord(key) - ord('E') 
    translated = ''
    for letter in message:
        if letter in LETTERS:
            num = LETTERS.find(letter)
            gap = num - key
            if gap < 0:
                gap += len(LETTERS)
            elif gap > 0:
                gap -= len(LETTERS)
            try:
               translated = translated + LETTERS[gap]
            except Exception as e:
               print(f"{e} - {gap}")
        else:
            translated = translated + letter
    print(f'Try key {key} - #{prt}: {translated}')

def decrypt_replace(message, key):
    translated = ''
    for symbol in message: 
        if symbol in LETTERS:
            num = LETTERS.find(symbol) 
            num = num - key
            if num < 0:
                num = num + len(LETTERS) 
            translated = translated + LETTERS[num]
        else:
            translated = translated + symbol 
    print(f'>> Try key = {key}\t Result: {translated}') 
if __name__ == '__main__':  
    message = 'asvphgyt' 
    for i in range(26):
        decrypt_replace(message.upper(), i)
