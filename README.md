# AmountKeyboard
金额键盘，专为输入金额自定义的键盘。通过inputView弹出键盘，block传值，使用简单。


演示：

![image](https://github.com/coderYeYu/AmountKeyboard/blob/master/AmountKeyboard/amount.gif)

使用方法：

    [AmountKeyboard initWithTextField:self.amountTF].changeTextBlock = ^(NSString *text) {
        NSLog(@"当前输入的金钱：%@",text);
    };
