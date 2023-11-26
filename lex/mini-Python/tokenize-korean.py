#!/usr/bin/env python3
import argparse
import re
import sys
import codecs
#from nltk import tokenize

def main():
    parser = argparse.ArgumentParser(
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--output', type=int, default=1,
                        help='0 to use <seg>sentence</seg> other is None <seg>')
    parser.add_argument('--text_file', type=str, default=None,
                        help='text file path')
    parser.add_argument('--sentence', type=str, default=None,
                        help='use user input sentence')
    parser.add_argument('--string_list', type=list, default=None,
                        help='use user input string list')
    
    sys.stdout = codecs.getwriter("utf-8")(sys.stdout.detach())
    args = parser.parse_args()

    if args.text_file != None:
        with open(args.text_file, 'r', encoding='utf-8-sig') as f:
            lines = f.readlines()
        tokenizer(args.output, lines)
    elif args.string_list != None:
        tokenizer(args.output, args.string_list)
    else:
        tokenizer(args.output, sentence_tokenize(args.sentence))

def tokenizer(output, lines):
    p1 = re.compile(r'.*<[^>]+>\s*$')
    p2 = re.compile(r"""([0-9]+(?![.,][0-9]+)?|[A-Za-z]+|[.?!…,\/.:;·ㆍㆍ'|
"|‘|’|“|”|“|\＊|＇|\＿\＿|#$|\%|&()*+<=>@\ \-\[\\\]\^`{}
~°±²¶¼½¿×ß÷ˇ˘˙˚|˝|ΔΦΩαβγδθλμνπφχ
ψω―‘|’|“|”|†‡‥…′″※₁₂₃℃℉ℓ№ΩÅ⅓⅔⅛ Ⅰ\.
|Ⅱ\.|Ⅲ\.|Ⅳ\.|Ⅴ\.|Ⅵ\.|Ⅶ\.|Ⅷ\.|Ⅸ\.|Ⅹ\.|ⅰ\.|ⅱ\.|ⅲ\.|
ⅳ\.|ⅴ\.|ⅵ\.|ⅶ\.|ⅷ\.|ⅸ\.|ⅹ\.|ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩⅰⅱⅲ
ⅳⅴⅵⅶⅷⅸⅹ←↑→↓↔↗↙⇒⇔∀∃∇∈√∞∠∥∧∨∩∪∫∴∵
∼∽≠≡≥≪≫⊃⊆⊙⌒①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑴⑵⑶⑷
⑸⑹⑺⑻⑼⑽⑾⒜⒝⒞ⓐⓑⓒⓓⓔⓛⓝⓧ─━│┬┼▒■□▣▦▨▲
△▶▷▼▽◀◁◆◇◈○◎●◐◑★☆☎☞♀♂♠♡♣♤♥♧♨♩♪
♬♭➀➌、。〃〈〉《》「」『』【】〓〔〕㉠㉡㉢㉣㉤㉥㉦㉧㉨㉩
㉪㉫㉬㉭㉮㉯㉰㉱㉲㉳㉴㉵㉶㉷㉸㉹㉺㉻㎉㎎㎏㎐㎖㎗㎜㎝㎞㎡㎢㎥
㎾㏄㏊＞～∥★■~∼\-])""")

    for line in lines:
        line = line.replace('\ufeff', '')
        if p1.match(line.strip()) is not None:
            print(line.strip())
        elif line != '':
            line = re.sub(r'[~∼～]', '~', line)
            line = re.sub(r'[·ㆍ]', '·', line)
            line = re.sub(r"['‘’˙`]", "'", line)
            line = re.sub(r'[“”"]', '"', line)
            m = re.split(p2, line.strip())
            m = list(filter(None, m))
            
            index = 0
            for i, token in enumerate(m):
                if i + 1 == len(m):
                    if index >= 1:
                        for num in range(index):
                            m[i - index] += '\n' + m[i - index + num + 1]
                            m[i - index + num + 1] = None
                elif token != ' ':
                    index += 1
                elif token == ' ':
                    if index > 1:
                        for num in range(index-1):
                            m[i - index] += '\n' + m[i - index + num + 1]
                            m[i - index + num + 1] = None
                        index = 0
                    else:
                        index = 0
            m = list(filter(None.__ne__, m))

            if output == 0:
                print('<seg>')
            for word in m:
                word = re.sub(r'  ', '', word)
                word = re.sub(r'^ ', '', word)
                word = re.sub(r' $', '', word)
                word = re.sub(r' ', '\n', word)
                if word != '':
                    print(word)
            if output == 0:
                print('</seg>')

def sentence_tokenize(text):
    text = re.sub('\s+', ' ', text)
    return tokenize.sent_tokenize(text)

if __name__ == '__main__':
    main()
