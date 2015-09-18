import re

token_list = '[\ (+\-)]'
op_dict = {
        '+' : (lambda a,b: a+b),
        '-' : (lambda a,b: a-b)
    }

def calculate(tokens_in):
    calc_stack = []
    cur = 0
    while True:
        try:
            cur = tokens_in.pop()
        except IndexError:
            break
        if cur == ')':
            exp = []
            while True:
                cur = calc_stack.pop()
                if cur == '(':
                    break
                exp.append(cur)
            while (len(exp) != 1):
                op1 = int(exp.pop())
                act = exp.pop()
                op2 = int(exp.pop())
                exp.append(str(op_dict[act](op1,op2)))
            tokens_in.append(exp[0])
        else:
            calc_stack.append(cur)
    return cur

def main():
    for i in xrange(int(raw_input())):
        text = raw_input().strip()
        tokens = ['('] + [x for x in re.split('([\ (+\-)])',text.replace(" ","")) if x] + [')']
        tokens.reverse()
        print text
        print calculate(tokens)
        print

if __name__ == '__main__':
    main()


# 3
# 1 + 1
#  2-1 + 2
# (1+(4+5+2)-3)+(6+8)
