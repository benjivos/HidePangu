@interface SBApplicationIcon

- (NSString *)applicationBundleID;

@end

%hook SBIconModel

- (BOOL)isIconVisible:(SBApplicationIcon *)applicationIcon
{
    NSArray *panguIdentifiers = @[@"com.e4bf058461-1-42", @"io.pangu.nvwastone"];
    BOOL iconVisible = %orig;

    if ([panguIdentifiers containsObject:[applicationIcon applicationBundleID]])
        return NO;

    return iconVisible;
}

%end
