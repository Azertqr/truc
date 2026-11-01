// ChessBotUnlock.mm
#import <Foundation/Foundation.h>

__attribute__((constructor))
static void chessBotUnlock() {
    NSUserDefaults *d = [NSUserDefaults standardUserDefaults];
    
    // ── Unlock subscription ──
    [d setBool:YES forKey:@"lifetimePro"];
    [d setBool:YES forKey:@"weekPro"];
    [d setBool:YES forKey:@"yearPro"];
    
    // Date d'expiration dans 99 ans
    NSDate *farFuture = [NSDate dateWithTimeIntervalSinceNow:60*60*24*365*99];
    [d setObject:farFuture forKey:@"expiryDate"];
    
    // subscriptionState = lifetime (2 = valeur enum lifetime d'après le code)
    [d setInteger:2 forKey:@"subscriptionState"];
    [d setObject:@"lifetime" forKey:@"SubscriptionState"];
    
    // ── Unlock engine limits ──
    // bookQueryTimes illimité
    [d setInteger:999999 forKey:@"bookQueryTimes"];
    
    // Max threads Stockfish (iPad 10 = A14 = 6 cores, on met 4 perf cores)
    [d setInteger:4 forKey:@"threadCountConfig"];
    
    // Hash size max (en MB, Stockfish recommande 25% RAM, iPad ~4GB = ~1024MB)
    [d setInteger:512 forKey:@"hashSizeConfig"];
    
    [d synchronize];
}
