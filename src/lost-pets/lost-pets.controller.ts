import { Body, Controller, Post } from '@nestjs/common';
import { EmailService } from 'src/email/email.service';
import { CreateLostPetDto } from './dtos/lost-pets.dto';
import { generateLostPetTemplate } from './templates/lost-pet.template';
import { BodyResponse } from './dtos/body-request.dto';
import { error } from 'console';

@Controller('lost-pets')
export class LostPetsController {

    constructor(private emailService: EmailService) {}

    @Post()
    async createLostPet(
        @Body() createLostPetDto: CreateLostPetDto
    ) {
        let response : BodyResponse = {
            status: 200,
            error: false,
            errormessage: undefined,
            data: undefined
        }
        try{
        const template = generateLostPetTemplate(createLostPetDto);
        await this.emailService.sendEmail(template);
        response.data = createLostPetDto;
        return response;
        }
        catch(e){
            response.status = 500;
            response.error = true;
            response.errormessage = 'Error creating lost pet';
            return response;
        }
    }
}
