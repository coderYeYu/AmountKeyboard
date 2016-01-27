# AmountKeyboard
金额键盘，一个专为输入金额自定义的键盘。简单集成，使用inputView弹出键盘，block传递输入值。


演示：

![image](https://github.com/coderYeYu/AmountKeyboard/blob/master/AmountKeyboard/amount.gif)

使用方法：

```c
[AmountKeyboard amountKBWithTextField:self.amountTF].changeTextBlock = ^(NSString *text) {
        NSLog(@"当前输入的金钱：%@",text);
    };


# 注
第一次分享自己demo，一个简单的自定义键盘。期待试用过的人可以提出一些改进的意见。
