Feature: add-new-comment-in-the-kanban-ticket

  Background: 
    * url baseUrl
    * header Accept = 'application/json, text/plain, */*'
    * def auth = call read('get-kanban-ticket-id.feature')
    * def tokenID = auth.tokenid
    * def projectId = auth.projectid
    * def kanbanBoardId = auth.kanbanboardid
    * def ticketId = auth.ticketid
    * def dnt = auth.dnt
    * def organizationId = auth.organizationId

  # POST request
  Scenario: add new comment in the kanban ticket
    * print tokenID
    * print projectId
    Given header Authorization = 'Bearer '+ tokenID
    Given header dnt = dnt
    Given header projectid = projectId
    Given header organizationid = organizationId
    Given url baseUrl + '/issue-management/1.0.0/kanban-boards/' + kanbanBoardId + '/tickets/' + ticketId + '/comments'
    And request {"commentDescription":"<p>yes1</p>"}
    When method POST
    Then status 204
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies
    
