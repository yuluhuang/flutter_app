import 'package:flutter/material.dart';

class ContactVO {
  String seationKey;
  String name;
  String avatarUrl;

  ContactVO({@required this.seationKey, this.name, this.avatarUrl});
}

List<ContactVO> contactData = [
  new ContactVO(
      seationKey: 'A',
      name: 'AAAAAA',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'B',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'C',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'D',
      name: 'AAAAAA',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'E',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'F',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'G',
      name: 'AAAAAA',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'H',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'Q',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'W',
      name: 'AAAAAA',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'R',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'T',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'Y',
      name: 'AAAAAA',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'B',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'B',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'C',
      name: 'AAAAAA',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'D',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'E',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'F',
      name: 'AAAAAA',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'B',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
  new ContactVO(
      seationKey: 'B',
      name: 'BBBBBB',
      avatarUrl:
          'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730'),
];
