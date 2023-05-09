# SwiftUIGraphQL

(Contentful + Apollo) -> Apollo ios SDK 


## 스키마 파일 가져오기
$ rover graph introspect https://graphql.contentful.com/content/v1/spaces/[spaceId] --header="Authorization: Bearer [tokenId]"  --output schema.graphqls


## 코드 생성 설정 파일 생성 
$ ./apollo-ios-cli init --schema-namespace GraphQL --module-type embeddedInTarget --target-name SwiftUIGraphQL --path ./SwiftUIGraphQL/apollo-codegen-config.json

operation을 위한 grapql 파일 생성 


$ ./SwiftUIGraphQL
$ ../apollo-ios-cli generate 

XCode 14.3 버전 이슈

Intall CLI 동작하지 않아서 apollo_ios_cli를 다운로드해서 사용해야 합니다.
