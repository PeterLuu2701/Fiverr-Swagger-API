import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { AuthService } from './auth.service';
import { CreateAuthDto } from './dto/create-auth.dto';
import { UpdateAuthDto } from './dto/update-auth.dto';
import { ApiBearerAuth, ApiBody, ApiProperty, ApiTags } from '@nestjs/swagger';

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

class userLoginType {
  @ApiProperty()
  email: string

  @ApiProperty()
  password: string
}

@ApiTags('auth')
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @ApiBody({ type: userType })
  @Post('sign-up')
  signUp(@Body() user: userType) { 
    return this.authService.create(user);
  }

  @ApiBody({ type: userLoginType }) 
  @Post('login') 
  async login(@Body() userLogin: userLoginType) { 
    try {
      const token = await this.authService.login(userLogin); 
      return { token }; 
    } catch (error) {
      return { message: error.message }; 
    }
  }
}
