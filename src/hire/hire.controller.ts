import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { HireService } from './hire.service';
import { CreateHireDto } from './dto/create-hire.dto';
import { UpdateHireDto } from './dto/update-hire.dto';
import { ApiBearerAuth, ApiBody, ApiProperty, ApiTags } from '@nestjs/swagger';
import { UpdateCompletedHireDto } from './dto/update-completed-hire.dto';
import { AuthGuard } from '@nestjs/passport';

class hireType {
  @ApiProperty()
  job_id: number

  @ApiProperty()
  user_id: number

  @ApiProperty()
  hire_date: Date

  @ApiProperty()
  complete: boolean
}

@ApiTags('hire')
@Controller('hire')
export class HireController {
  constructor(private readonly hireService: HireService) {}

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @ApiBody({ type: hireType })
  @Post('create-hire')
  create(@Body() createHireDto: CreateHireDto) {
    return this.hireService.create(createHireDto);
  }

  @Get('get-all-hirings')
  findAll() {
    return this.hireService.findAll();
  }

  @Get('get-hiring-by-id/:id')
  findOne(@Param('id') id: string) {
    return this.hireService.findOne(+id);
  }

  @Get('get-hired/:id')
  findHired(@Param('id') id: string) {
    return this.hireService.findHired(+id);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Patch('update-hiring-by-id/:id')
  update(@Param('id') id: string, @Body() updateHireDto: UpdateHireDto) {
    return this.hireService.update(+id, updateHireDto);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.hireService.remove(+id);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Patch('complete-marking-by-id/:id')
  updateCompleted(@Param('id') id: string, @Body() updateCompletedHireDto: UpdateCompletedHireDto) {
    return this.hireService.updateCompleted(+id, updateCompletedHireDto);
  }
}
