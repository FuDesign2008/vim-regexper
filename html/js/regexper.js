/*
 * Copyright (c) 2008 Stefan Lange-Hegermann
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * */
function microAjax(url, callbackFunction)
{
    this.bindFunction = function (caller, object) {
        return function() {
            return caller.apply(object, [object]);
        };
    };
    this.stateChange = function (object) {
        if (this.request.readyState==4)
            this.callbackFunction(this.request.responseText);
    };
    this.getRequest = function() {
        if (window.ActiveXObject)
            return new ActiveXObject('Microsoft.XMLHTTP');
        else if (window.XMLHttpRequest)
            return new XMLHttpRequest();
        return false;
    };
    this.postBody = (arguments[2] || "");
    this.callbackFunction=callbackFunction;
    this.url=url;
    this.request = this.getRequest();
    if(this.request) {
        var req = this.request;
        req.onreadystatechange = this.bindFunction(this.stateChange, this);
        if (this.postBody!=="") {
            req.open("POST", url, true);
            req.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
            req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            req.setRequestHeader('Connection', 'close');
        } else {
            req.open("GET", url, true);
        }
        req.send(this.postBody);
    }
}
require.config({
    baseUrl: '/assets'
});
(function() {
    var form = document.getElementById('regexp_form'),
    input = document.getElementById('regexp_input'),
    error = document.getElementById('error'),
        paper_container = document.getElementById('paper-container'),
        current_request = null;
    form.onsubmit = function() {
        if (current_request) {
            return false;
        }
        if (input.value === '') {
            return false;
        }
        paper_container.innerHTML = '';
        error.innerHTML = '';
        document.body.className = 'is-loading';
        current_request = new microAjax(form.action, function(text) {
            if (this.request.status == 200) {
                document.body.className += ' has-results';
                window.location.hash = encodeURIComponent(input.value);
                require(['regexper'], function(Regexper) {
                    Regexper.draw(paper_container, JSON.parse(text), function() {
                        document.body.className = 'has-results';
                        current_request = null;
                    });
                });
            } else {
                error.innerHTML = JSON.parse(text).error;
                document.body.className = 'has-results';
                current_request = null;
            }
        }, input.value);
        return false;
    };
}());
(function() {
    var old_hash = '',
    render = function(expression) {
        if (expression){
            document.getElementById('regexp_input').value = decodeURIComponent(expression);
            document.getElementById('regexp_form').onsubmit();
        }
    },
    hash_check = function() {
        var hash = location.hash.slice(1);
        if (hash !== old_hash) {
            old_hash = hash;
            render(hash);
        }
    };
    if ('onhashchange' in window) {
        window.onhashchange = hash_check;
        window.onload = hash_check;
    } else {
        window.onload = function() {
            setInterval(hash_check, 100);
        };
    }
}());

