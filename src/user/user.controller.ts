import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { UserService } from './user.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { ApiBearerAuth, ApiBody, ApiProperty, ApiTags } from '@nestjs/swagger';
import { AuthGuard } from '@nestjs/passport';

class userType {
  @ApiProperty()
  name: string

  @ApiProperty()
  email: string

  @ApiProperty()
  password: string

  @ApiProperty()
  phone: string

  @ApiProperty()
  birthday: Date

  @ApiProperty()
  gender: string

  @ApiProperty({ default: 'member' })
  role: string = 'member';
}

@ApiTags('user')
@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @ApiBody({ type: userType })
  @Post('create-user')
  signUp(@Body() user: userType) {
    return this.userService.create(user);
  }

  @Get('get-all-users')
  findAll() {
    return this.userService.findAll();
  }

  @Get('get-user-by-id/:id')
  findOneById(@Param('id') id: string) {
    return this.userService.findOneById(+id);
  }

  @Get('get-user-by-user-name/:userName')
  findOneByUserName(@Param('userName') userName: string) {
    return this.userService.findOneByUserName(userName);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Patch('update-user-by-id/:id')
  update(@Param('id') id: string, @Body() updateUserDto: UpdateUserDto) {
    return this.userService.update(+id, updateUserDto);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.userService.remove(+id);
  }
}
