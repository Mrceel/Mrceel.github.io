<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/aplayer/1.10.0/APlayer.min.js"></script>
<link href="https://cdn.bootcss.com/aplayer/1.10.0/APlayer.min.css" rel="stylesheet">
<div id="about">
    <div id="aplayer"></div>
    <div class="skill">
        <div class="explain">
             <dl>
                <dt><img src="{{ theme.touxiang.img }}"></dt>
                <dd>
                    <h3>{{ theme.touxiang.name }}</h3>
                    <div>
                        <p>兴趣爱好：</p>
                        <div>
                            {% for key in theme.touxiang.love %}
                                <span>{{ key }}</span>
                            {% endfor %}
                        </div>
                    </div>
                    <div>
                        <p>联系方式：</p>
                        <div>
                            <ul>
                                <li><span><i class="fa fa-qq"></i></span>&nbsp;&nbsp;&nbsp;{{ theme.touxiang.qq }}</li>
                                <li><span><i class="fa fa-phone"></i></span>&nbsp;&nbsp;&nbsp;{{ theme.touxiang.tel }}</li>
                            </ul>
                        </div>
                    </div>
                </dd>
            </dl>
        </div>
        <div id="skill-chart" style="height: 500px;"></div>
    </div>
</div>
<script src="/js/src/echarts.js"></script>
<script>
    const ap = new APlayer({
        container: document.getElementById('aplayer'),
        theme: '#FFAE57',
        loop: 'all', //循环播放 all one none
        preload: 'metadata', //预加载 auto none metadata
        listFolded: true,//默认折叠
        audio: [
            {
                name: '蜜蜂 demo',
                artist: '万岁爺',
                url: '/music/万岁爺 - 蜜蜂 demo.mp3',
                cover: '',
            },{
                name: '告白气球',
                artist: '二珂',
                url: '/music/二珂+告白气球.mp3',
                cover: '',
            },{
                name: '追梦赤子心',
                artist: 'GALA',
                url: '/music/GALA - 追梦赤子心.mp3',
                cover: '',
            }
        ]
    });
    
    
     var colors = ['#FFAE57', '#FF7853', '#EA5151', '#CC3F57', '#9A2555'];
    var bgColor = '#2E2733';
    // var bgColor = '#737777';
    
    var itemStyle = {
        star5: {
            color: colors[0]
        },
        star4: {
            color: colors[1]
        },
        star3: {
            color: colors[2]
        },
        star2: {
            color: colors[3]
        }
    };
    
    var data = [{
        name: '服务端',
        itemStyle: {
            color: colors[2]
        },
        children: [{
            name: 'MySQL',
            children: [ {
                name: '',
                 label: {
                    color: '#fff',
                    downplay: {
                        opacity: 0.5
                    }
                },
                children: [{
                    name: '',
                    value: 1, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                }]
            }]
        },{
            name: 'Python',
            children: [ {
                name: 'Django',
                label: {
                    color: '#fff',
                    downplay: {
                        opacity: 0.5
                    }
                },
                children: [{
                    name: 'web and app',
                    value: 2, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                },{
                    name: '网络爬虫',
                    value: 1, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                }]
            }]
        },{
            name: 'Java',
            children: [ {
                name: '',
                 label: {
                    color: '#fff',
                    downplay: {
                        opacity: 0.5
                    }
                },
                children: [{
                    name: 'Spring',
                    value: 1, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                }]
            }]
        },{
            name: 'Node',
            children: [ {
                name: '',
                 label: {
                    color: '#fff',
                    downplay: {
                        opacity: 0.5
                    }
                },
                children: [{
                    name: ' experss',
                    value: 1, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                }]
            }]
        }]
    },{
        name: '前端',
        itemStyle: {
            color: colors[1]
        },
        children: [{
            name: '页面制作',
            children: [ {
                name: 'Html5',
                 label: {
                    color: '#fff',
                    downplay: {
                        opacity: 0.5
                    }
                },
                children: [{
                    name: '熟练各种布局方式',
                    value: 2, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                },{
                    name: 'Convas',
                    value: 1, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                }]
            },{
                name: 'Css3',
                 label: {
                    color: '#fff',
                    downplay: {
                        opacity: 0.5
                    }
                },
                children: [{
                    name: 'Less',
                    value: 1, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                },{
                    name: 'Sass',
                    value: 1, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                },{
                    name: 'Scss',
                    value: 1, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                }]
            },]
        },{
            name: '页面交互',
            children: [ {
                name: 'Javascript',
                 label: {
                    color: '#fff',
                    downplay: {
                        opacity: 0.5
                    }
                },
                children: [{
                    name: 'Typrscript',
                    value: 1, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                },{
                    name: 'Angular',
                    value: 1, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                },{
                    name: 'React',
                    value: 1, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                },{
                    name: 'Vue',
                    value: 2, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                }]
            },]
        },{
            name: '数据处理',
            children: [ {
                name: '数据获取',
                 label: {
                    color: '#fff',
                    downplay: {
                        opacity: 0.5
                    }
                },
                children: [{
                    name: 'Ajax',
                    value: 2, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                },{
                    name: 'Jsonp',
                    value: 2, //所占面积
                    label: {
                        color: '#FF7853'
                    },
                    itemStyle: {
                        color: '#EA5151'
                    }
                }]
            }]
        }]
    }];
    
    for (var j = 0; j < data.length; ++j) {
        var level1 = data[j].children;
    
        for (var i = 0; i < level1.length; ++i) {
            
            level1[i].itemStyle = {
                color: data[j].itemStyle.color
            };
        }
    }
    
    option = {
        backgroundColor: bgColor,
        color: colors,
        series: [{
            type: 'sunburst',
            center: ['50%', '55%'],
            data: data,
            sort: function (a, b) {
                if (a.depth === 1) {
                    return b.getValue() - a.getValue();
                }
                else {
                    return a.dataIndex - b.dataIndex;
                }
            },
            label: {
                rotate: 'radial',
                color: bgColor
            },
            itemStyle: {
                borderColor: bgColor,
                borderWidth: 2
            },
            levels: [{}, {
                r0: 0,
                r: 40,
                label: {
                    rotate: 0
                }
            }, {
                r0: 40,
                r: 105
            }, {
                r0: 115,
                r: 140,
                itemStyle: {
                    shadowBlur: 2,
                    shadowColor: colors[2],
                    color: 'transparent'
                },
                label: {
                    rotate: 'tangential',
                    fontSize: 10,
                    color: colors[0]
                }
            }, {
                r0: 140,
                r: 145,
                itemStyle: {
                    shadowBlur: 80,
                    shadowColor: colors[0]
                },
                label: {
                    position: 'outside',
                    textShadowBlur: 5,
                    textShadowColor: '#333',
                },
                downplay: {
                    label: {
                        opacity: 0.5
                    }
                }
            }]
        }]
    };
        echarts.init(document.getElementById('skill-chart')).setOption(option);
    </script>