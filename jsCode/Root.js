import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
    TouchableHighlight,
} from 'react-native';
var AppRoute = require('./RNBridge');
class HelloWorld extends Component {
  login(){
    AppRoute.route('View','login', (rst, loginInfo)=>{
        console.log(loginInfo);
    })

  };
  render() {
    return (
        <View style={styles.container}>
          <Text style={styles.welcome}>
            Welcome to React Native!
          </Text>
          <Text style={styles.instructions}>
           点了去登录按钮以后要很久才push，这是什么奇怪的问题？
          </Text>
          <Text style={styles.instructions}>
            Press Cmd+R to reload,{'\n'}
            Cmd+D or shake for dev menu
          </Text>
          <View style={styles.searchBtnArea}>
            <View style={styles.search_btn_wrapper}>
              <TouchableHighlight
                  underlayColor="#ED5F37"
                  onPress={this.login}
                  activeOpacity={0.7}>
                <Text style={styles.search_btn}>去登录</Text>
              </TouchableHighlight>
            </View>
          </View>
        </View>
    );
  }
}

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  searchBtnArea: {
    justifyContent: 'center',
    marginLeft: 20,
    marginRight: 20,
    marginTop: 30,
    flexDirection: 'row',
    alignItems: 'center',
  },
  search_btn_wrapper: {
    backgroundColor: '#FC6E50',
    borderRadius: 5,
    flex: 1
  },
  search_btn: {
    fontSize: 20,
    paddingTop: 10,
    paddingBottom: 10,
    color: '#ffffff',
    textAlign: 'center',
  },


});
HelloWorld.external = true;
module.exports = HelloWorld;
