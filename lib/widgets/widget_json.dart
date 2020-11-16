var containerJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type": "Text",
    "data": "Flutter dynamic widget",
    "maxLines": 3,
    "overflow": "ellipsis",
    "style": {
      "color": "#00FFFF",
      "fontSize": 20.0
    }
  }
}
''';

var textJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type": "Text",
    "data": "Flutter dynamic widget",
    "maxLines": 3,
    "overflow": "ellipsis",
    "style": {
      "color": "#00FFFF",
      "fontSize": 20.0,
      "fontWeight": "bold",
      "decoration": "underline"
    }
  }
}
''';

var selectableTextJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type": "SelectableText",
    "data": "Flutter dynamic widget",
    "maxLines": 3,
    "style": {
      "color": "#00FFFF",
      "fontSize": 20.0,
      "fontWeight": "bold",
      "decoration": "underline"
    }
  }
}
''';

var textSpanJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type": "Text",
    "maxLines": 3,
    "textSpan": {
      "text": "Flutter",
      "style": {
        "color": "#00FFFF",
        "fontSize": 26.0
      },
      "recognizer": "route://productDetail?goods_id=123",
      "children": [
        {
          "text": " dynamic",
          "style": {
            "fontSize": 22.0
          }
        },
        {
          "text": " widget",
          "style": {
            "color": "#00FF00",
            "fontSize": 18.0
          }
        }
      ]
    }
  }
}
''';

var iconJson = '''
{
  "type": "Row",
  "mainAxisAlignment": "spaceAround",
  "children":[
    {
      "type" : "Icon",
      "data" : "fa.google",
      "color" : "#000000",
      "size" : 36.0
    },
    {
      "type" : "Icon",
      "data" : "favorite",
      "color" : "#FFC0CB",
      "size" : 24.0,
      "semanticLabel" : "Text to announce in accessibility modes"
    },
    {
      "type" : "Icon",
      "data" : "audiotrack",
      "color" : "#008000",
      "size" : 30.0
    },
    {
      "type" : "Icon",
      "data" : "beach_access",
      "color" : "#0000FF",
      "size" : 36.0
    }
  ]
}
''';

var dropCapTextJson = '''
{
  "type": "ListView",
  "padding": "10, 10, 10, 10",
  "children":[
      {
         "type":"Column",
         "children":[
            {
               "type":"DropCapText",
               "selectable":true,
               "data":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac turpis egestas maecenas pharetra convallis posuere morbi leo. Fermentum odio eu feugiat pretium. Lacinia quis vel eros donec ac. At elementum eu facilisis sed odio morbi quis commodo odio. Augue lacus viverra vitae congue eu consequat ac felis. Blandit aliquam etiam erat velit. Morbi tincidunt augue interdum velit euismod. Sed libero enim sed faucibus turpis. Sagittis eu volutpat odio facilisis. Ultricies mi eget mauris pharetra et ultrices neque. Urna cursus eget nunc scelerisque viverra. Orci phasellus egestas tellus rutrum tellus. Et magnis dis parturient montes nascetur ridiculus mus. Arcu cursus vitae congue mauris rhoncus aenean. Varius morbi enim nunc faucibus. Semper eget duis at tellus at urna condimentum mattis. Massa sapien faucibus et molestie ac feugiat sed. Convallis aenean et tortor at risus. Massa ultricies mi quis hendrerit dolor magna eget est lorem. Vulputate odio ut enim blandit. Velit ut tortor pretium viverra suspendisse. Lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis. Egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium. Vitae tempus quam pellentesque nec nam aliquam sem et tortor. Tincidunt ornare massa eget egestas purus viverra accumsan in. Non consectetur a erat nam at lectus urna duis convallis. Et magnis dis parturient montes nascetur ridiculus mus mauris. Elit eget gravida cum sociis natoque. Sit amet consectetur adipiscing elit ut aliquam purus sit amet. Fringilla urna porttitor rhoncus dolor purus non. Dui accumsan sit amet nulla facilisi morbi tempus. Tellus in hac habitasse platea dictumst vestibulum. Ultricies integer quis auctor elit sed vulputate mi sit amet.",
               "style":{
                  "fontSize":18.1
               }
            }
         ]
      }
  ]
}
''';

var dropCapTextImageJson = '''
{
  "type": "ListView",
  "padding": "10, 10, 10, 10",
  "children":[
    {
       "type":"Column",
       "children":[
          {
             "type":"DropCapText",
             "selectable":true,
             "data":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac turpis egestas maecenas pharetra convallis posuere morbi leo. Fermentum odio eu feugiat pretium. Lacinia quis vel eros donec ac. At elementum eu facilisis sed odio morbi quis commodo odio. Augue lacus viverra vitae congue eu consequat ac felis. Blandit aliquam etiam erat velit. Morbi tincidunt augue interdum velit euismod. Sed libero enim sed faucibus turpis. Sagittis eu volutpat odio facilisis. Ultricies mi eget mauris pharetra et ultrices neque. Urna cursus eget nunc scelerisque viverra. Orci phasellus egestas tellus rutrum tellus. Et magnis dis parturient montes nascetur ridiculus mus. Arcu cursus vitae congue mauris rhoncus aenean. Varius morbi enim nunc faucibus. Semper eget duis at tellus at urna condimentum mattis. Massa sapien faucibus et molestie ac feugiat sed. Convallis aenean et tortor at risus. Massa ultricies mi quis hendrerit dolor magna eget est lorem. Vulputate odio ut enim blandit. Velit ut tortor pretium viverra suspendisse. Lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis. Egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium. Vitae tempus quam pellentesque nec nam aliquam sem et tortor. Tincidunt ornare massa eget egestas purus viverra accumsan in. Non consectetur a erat nam at lectus urna duis convallis. Et magnis dis parturient montes nascetur ridiculus mus mauris. Elit eget gravida cum sociis natoque. Sit amet consectetur adipiscing elit ut aliquam purus sit amet. Fringilla urna porttitor rhoncus dolor purus non. Dui accumsan sit amet nulla facilisi morbi tempus. Tellus in hac habitasse platea dictumst vestibulum. Ultricies integer quis auctor elit sed vulputate mi sit amet.",
             "style":{
                "fontSize":18.1
             },
             "dropCapPadding":"0,0,16.1,0",
             "dropCapPosition":"start",
             "dropCap":{
                "width":216.1,
                "height":162.1,
                "child":{
                   "type":"NetworkImage",
                   "src":"https://b.appsimg.com/upload/momin/2019/01/23/101/1548249269085.png",
                   "click_event" : "route://productDetail?goods_id=123"
                }
             }
          }
       ]
    }
  ]
}      
''';

var raisedButtonJson = '''
{
  "type": "Container",
  "alignment": "center",
  "child": {
    "type": "RaisedButton",
    "color": "##FF00FF",
    "padding": "8,8,8,8",
    "textColor": "#00FF00",
    "elevation" : 8.0,
    "splashColor" : "#00FF00",
    "click_event" : "route://productDetail?goods_id=123",
    "child" : {
      "type": "Text",
      "data": "I am a button"
    }  
  }
}
''';

var rowJson = '''
{
  "type": "Row",
  "crossAxisAlignment": "start",
  "mainAxisAlignment": "start",
  "mainAxisSize": "max",
  "textBaseline": "alphabetic",
  "textDirection": "ltr",
  "verticalDirection": "down",
  "children":[
    {
      "type" : "Text",
      "data" : "Flutter"
    },
    {
      "type": "RaisedButton",
      "color": "##FF00FF",
      "padding": "8,8,8,8",
      "textColor": "#00FF00",
      "elevation" : 8.0,
      "splashColor" : "#00FF00",
      "child" : {
        "type": "Text",
        "data": "Widget"
      }
    },
    {
      "type" : "Text",
      "data" : "Demo"
    }
  ]
}
''';

var columnJson = '''
{
  "type": "Column",
  "crossAxisAlignment": "start",
  "mainAxisAlignment": "start",
  "mainAxisSize": "max",
  "textBaseline": "alphabetic",
  "textDirection": "ltr",
  "verticalDirection": "down",
  "children":[
    {
      "type" : "Text",
      "data" : "Flutter"
    },
    {
      "type": "RaisedButton",
      "color": "##FF00FF",
      "padding": "8,8,8,8",
      "textColor": "#00FF00",
      "elevation" : 8.0,
      "splashColor" : "#00FF00",
      "child" : {
        "type": "Text",
        "data": "Widget"
      }
    },
    {
      "type" : "Text",
      "data" : "Demo"
    }
  ]
}
''';

var assetImageJson = '''
{
  "type": "Container",
  "color": "#FFFFFF",
  "alignment": "center",
  "child": {
    "type": "AssetImage",
    "name": "assets/vip.png"
  }
}
''';

var networkImageJson = '''
{
  "type": "Container",
  "color": "#FFFFFF",
  "alignment": "center",
  "child": {
    "type": "NetworkImage",
    "src": "https://b.appsimg.com/upload/momin/2019/01/23/101/1548249269085.png"
  }
}
''';

var placeholderJson = '''
{
  "type": "Container",
  "color": "#FFFFFF",
  "alignment": "center",
  "child": {
    "type": "Placeholder",
    "color": "#00FF00",
    "strokeWidth": 6.0,
    "fallbackWidth": 100.0,
    "fallbackHeight": 200.0
  }
}
''';

var gridviewJson = '''
{
  "type": "GridView",
  "crossAxisCount": 2,
  "padding": "10, 10, 10, 10",
  "mainAxisSpacing": 4.0,
  "crossAxisSpacing": 4.0,
  "childAspectRatio": 1.6,
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}
''';

var listviewJson = '''
{
  "type": "ListView",
  "padding": "10, 10, 10, 10",
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}
''';

var pageviewJson = '''
{
  "type": "PageView",
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}
''';

var expandedJson = '''
{
  "type": "Row",
  "crossAxisAlignment": "start",
  "mainAxisAlignment": "start",
  "textBaseline": "alphabetic",
  "textDirection": "ltr",
  "children":[
    {
      "type" : "Text",
      "data" : "Flutter"
    },
    {
      "type": "RaisedButton",
      "color": "##FF00FF",
      "padding": "8,8,8,8",
      "textColor": "#00FF00",
      "elevation" : 8.0,
      "splashColor" : "#00FF00",
      "child" : {
        "type": "Text",
        "data": "Widget"
      }
    },
    {
      "type" : "Text",
      "data" : "Demo"
    },
    {
      "type" : "Expanded",
      "child" : {
        "type" : "Container",
        "color" : "#FFFF00",
        "alignment" : "center",
        "child" : {
          "type" : "Text",
          "data" : "Expanded Widget"
        }
      }
    }
  ]
}
''';

var listviewLoadmoreJson = '''
{
  "type": "ListView",
  "padding": "10, 10, 10, 10",
  "pageSize": 10,
  "loadMoreUrl": "http://127.0.0.1:8080/list.json",
  "isDemo": true,
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}
''';

var gridviewloadmoreJson = '''
{
  "type": "GridView",
  "crossAxisCount": 2,
  "padding": "10, 10, 10, 10",
  "mainAxisSpacing": 4.0,
  "crossAxisSpacing": 4.0,
  "childAspectRatio": 1.6,
  "pageSize": 10,
  "loadMoreUrl": "http://127.0.0.1:8080/list.json",
  "isDemo": true,
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}
''';

var stackJson = '''
{
  "type": "Stack",
  "alignment": "topLeft",
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "Positioned",
      "top": 50.0,
      "left": 50.0,
      "child":{
        "type": "AssetImage",
        "name": "assets/vip.png"
      }
    }
  ]
}
''';

var indexedstackJson = '''
{
  "type": "IndexedStack",
  "alignment": "topLeft",
  "index": 1,
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "Positioned",
      "top": 50.0,
      "left": 50.0,
      "child":{
        "type": "AssetImage",
        "name": "assets/vip.png"
      }
    }
  ]
}
''';

var sizedboxJson = '''
{
  "type": "Stack",
  "alignment": "topLeft",
  "children":[
    {
      "type": "ExpandedSizedBox",
      "child":{
        "type":"Container",
        "color": "#0000FF"
      }
    },
    {
      "type": "SizedBox",
      "width": 100.0,
      "height": 100.0,
      "child":{
        "type":"Container",
        "color": "#CC00FF"
      }
    }
  ]
}
''';

var opacityJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type":"Opacity",
    "opacity": 0.3,
    "child":{
        "type": "Text",
        "data": "Flutter dynamic widget",
        "maxLines": 3,
        "overflow": "ellipsis",
        "style": {
          "color": "#00FFFF",
          "fontSize": 20.0
        }
    }
  }
}
''';

var wrapJson = '''
{
  "type": "Wrap",
  "spacing" : 8.0,
  "runSpacing" : 8.0,
  "alignment":"center", 
  "runAlignment" : "start",
  "crossAxisAlignment":"center",
  "children": [
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "XXL"
        }  
      },
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "XL"
        }  
      }   
      ,
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "SSL"
        }  
      }   ,
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "L"
        }  
      },
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "LLL"
        }  
      },
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "GGG"
        }  
      },
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "AAA"
        }  
      }             
  ]
}
''';

var cliprrectJson = '''
{
  "type": "Container",
  "alignment": "center",
  "child": {
    "type":"ClipRRect",
    "borderRadius":"10,20,30,40",
    "child":{
      "type": "SizedBox",
      "width": 100.0,
      "height": 100.0,
      "child":{
        "type":"Container",
        "color": "#CC00FF"
      }
    }
  }
}
''';

var safeareaJson = '''
{
  "type": "SafeArea",
  "child":{
      "type":"Center",
        "child": {
            "type":"ClipRRect",
            "borderRadius":"10,20,30,40",
            "child":{
            "type": "SizedBox",
            "width": 100.0,
            "height": 100.0,
            "child":{
                "type":"Container",
                "color": "#CC00FF"
            }
            }
        }
  }
}
''';

var listTileJson = '''
{
  "type": "ListView",
  "padding": "10, 10, 10, 10",
  "pageSize": 10,
  "children":[
    {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    },
        {
      "type": "ListTile",
      "leading": {
        "type":"Text",
        "data":"Leading text"
      },
      "title":{
        "type":"Text",
        "data":"Title text"
      },
      "subtitle":{
        "type":"Text",
        "data":"Subtitle text"
      } 
    }
  ]
}
''';
