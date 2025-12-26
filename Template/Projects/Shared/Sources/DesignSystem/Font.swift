/**
 @module: Font
 @author: kimsm
 @since: 12/23/25
 @desc
 @remark
 */
import UIKit

extension UIFont {
    
}

public enum AppFont {
    public static func regular(_ size: CGFloat) -> UIFont {
        UIFont(name: "SpoqaHanSansNeo-Regular", size: size)!
    }

    public static func medium(_ size: CGFloat) -> UIFont {
        UIFont(name: "SpoqaHanSansNeo-Medium", size: size)!
    }

    public static func bold(_ size: CGFloat) -> UIFont {
        UIFont(name: "SpoqaHanSansNeo-Bold", size: size)!
    }
    
    public enum Intonation {
        public enum Chinisee {
            public static func regular(_ size: CGFloat) -> UIFont {
                UIFont(name: "NotoSansSC-Regular", size: size)!
            }

            public static func medium(_ size: CGFloat) -> UIFont {
                UIFont(name: "NotoSansSC-Medium", size: size)!
            }

            public static func bold(_ size: CGFloat) -> UIFont {
                UIFont(name: "NotoSansSC-Bold", size: size)!
            }
        }
        
        public enum Japanese {
            public static func regular(_ size: CGFloat) -> UIFont {
                UIFont(name: "NotoSansJP-Regular", size: size)!
            }

            public static func medium(_ size: CGFloat) -> UIFont {
                UIFont(name: "NotoSansJP-Medium", size: size)!
            }

            public static func bold(_ size: CGFloat) -> UIFont {
                UIFont(name: "NotoSansJP-Bold", size: size)!
            }
        }
    }
}
