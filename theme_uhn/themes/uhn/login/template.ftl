<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&amp;display=swap" rel="stylesheet">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"></title>
    <link rel="shortcut icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!} template">
    <div class="topbar">
        <div class="logo"></div>
        <h6 class="tagline">Log in with myUHN</h6>
    </div>
    <div id="kc-container" class="${properties.kcContainerClass!}">
        <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">

            <div id="kc-content" class="${properties.kcContentClass!}">
                <div id="kc-content-wrapper" class="${properties.kcContentWrapperClass!}">

                    <#if displayMessage && message?has_content>
                        <div class="${properties.kcFeedbackAreaClass!}">
                            <div class="alert alert-${message.type}">
                                <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                                <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                                <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                                <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                                <span class="kc-feedback-text">${message.summary}</span>
                            </div>
                        </div>
                    </#if>

                    <div id="kc-form" class="${properties.kcFormAreaClass!}">
                        <h5 class="content-title">Log in with myUHN</h5>
                        <div class="content-tagline">Use your myUHN credentials to log in to PATH.</div>
                        <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!}">
                            <#nested "form">
                        </div>

                        <div class="footer-info">
                            <div class="footer-info-font">
                                <span>Don’t have a myUHN account?</span>&nbsp;<a href="https://path.uhn.ca/login#guest">Log in as a guest</a>
                            </div>
                            <div class="footer-info-font">
                                <a href="https://www.uhn.ca/PatientsFamilies/myUHN/Pages/how_register.aspx">Learn more about myUHN registration.</a>
                            </div>
                        </div>
                    </div>

                    <#if displayInfo>
                        <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                            <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>
                </div>
            </div>

            <#if realm.internationalizationEnabled>
                <div id="kc-locale" class="${properties.kcLocaleClass!}">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                        <div class="kc-dropdown language-picker" id="kc-locale-dropdown">

                            <div class="form-inline">
                                <div class="form-group">
                                    <label for="language-picker-dropdown" class="language-picker-dropdown-label">
                                        <i class="fa fa-2x fa-globe"></i>
                                    </label>
                                    <select id="language-picker-dropdown" class="form-control" onchange="languageSelected()">
                                        <#list locale.supported as l>
                                            <#if l.label = locale.current>
                                                <option value="" selected>${l.label}</option>
                                            <#else>
                                                <option value="${l.url}">${l.label}</option>
                                            </#if>
                                            <!-- <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li> -->
                                        </#list>
                                    </select>

                                    <!-- <a href="#" id="kc-current-locale-link">${locale.current}</a> -->
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </#if>

        </div>
    </div>
</body>
</html>
</#macro>
