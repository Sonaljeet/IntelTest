$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("features/DemoLogin.feature");
formatter.feature({
  "line": 2,
  "name": "DemoLogin",
  "description": "",
  "id": "demologin",
  "keyword": "Feature",
  "tags": [
    {
      "line": 1,
      "name": "@default"
    }
  ]
});
formatter.scenario({
  "line": 3,
  "name": "Login demo",
  "description": "",
  "id": "demologin;login-demo",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 4,
  "name": "user is on login page",
  "keyword": "Given "
});
formatter.match({
  "location": "DemoLogin_StepsDefinition.user_is_on_login_page()"
});
formatter.result({
  "duration": 7235883629,
  "status": "passed"
});
});