# AmountKeyboard
金额键盘，专为输入金额自定义的键盘。通过inputView弹出键盘，block传值，使用简单。


演示：

![image](https://github.com/coderYeYu/AmountKeyboard/blob/master/AmountKeyboard/amount.gif)

使用方法：

    [AmountKeyboard initWithTextField:self.amountTF].changeTextBlock = ^(NSString *text) {
        NSLog(@"当前输入的金钱：%@",text);
    };


# 注
第一次分享自己demo，一个简单的自定义键盘。期待试用过的人可以提出一些改进的意见。
