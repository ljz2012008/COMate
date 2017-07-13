//
// This is a sample Advanced preference pane
//

#import <MASPreferences/MASPreferences.h>

@interface AdvancedPreferencesViewController : NSViewController <MASPreferencesViewController> {
    __unsafe_unretained NSTextField *_textField;
    __unsafe_unretained NSTableView *_tableView;
}

@property (nonatomic, assign) IBOutlet NSTextField *textField;
@property (assign) IBOutlet NSTableView *tableView;

@end
