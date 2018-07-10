@interface PSUIAppleAccountCell : UITableViewCell @end
@interface PSUIAppleAccountLoginCell : UITableViewCell @end

static void anonCloudDoThing(UITableViewCell *cell) {
	CGRect frame = CGRectZero;
	for (UIView *view in cell.contentView.subviews) {
		if ([view isKindOfClass:[UIImageView class]]) {
			view.hidden = YES;
			frame = view.frame;
		}
	}
	for (UIView *view in cell.contentView.subviews) {
		if (![view isKindOfClass:[UIImageView class]]) {
			CGRect _frame = view.frame;
			_frame.size.width += frame.size.width;
			_frame.origin.x -= frame.size.width;
			view.frame = _frame;
		}
	}
}

%hook PSUIAppleAccountCell

- (void)layoutSubviews {
	%orig;
	anonCloudDoThing(self);
}

%end

%hook PSUIAppleAccountLoginCell

- (void)layoutSubviews {
	%orig;
	anonCloudDoThing(self);
}

%end
