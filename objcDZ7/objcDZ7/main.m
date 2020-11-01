//
//  main.m
//  objcDZ7
//
//  Created by Алексей Мальков on 01.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        printf("Введите текст или -1 для записи на диск:");
        
        char c[255];
        BOOL doSmthn = true;
        
        NSMutableString *string = [[NSMutableString alloc] init];
                
        NSMutableArray *users_input = [[NSMutableArray alloc] init];
        
        do {
            scanf(" %s", c);
            
            string = [NSMutableString stringWithCString:c encoding:1];

            if ([string  isNotEqualTo: @"-1"] == YES) {
                [users_input addObject:string];
                printf("текст или -1 для записи: ");
            } else {
                doSmthn = false;
            }
        } while (doSmthn);
        
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        path = [path stringByAppendingString:@"/UsersInput.plist"];
        [users_input writeToFile:path atomically:YES];
        NSLog(@"%@", users_input);
        
        users_input = nil;
        NSLog(@"%@", users_input);
        
        users_input = [NSMutableArray arrayWithContentsOfFile:path];
        NSLog(@"%@", users_input);
        
    }
    return 0;
}
